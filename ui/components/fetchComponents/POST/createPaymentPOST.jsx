import axios from "axios";
import { DATA } from "@/app/data";
import TokenManager from "@/app/apis/TokenManager";
import { parseEther, formatEther, ethers } from "ethers";

export default async function createPaymentPOST(paymentData, open, creatorWallet) {

    try {
        const txHash = await open({
            recipientAddress: creatorWallet,
            value: parseEther("0.000000001"), // Amount in Wei
        });

        if (!txHash) {
            throw new Error("⚠️ Transaction hash is undefined. Open() might have failed.");
        }


        const provider = new ethers.BrowserProvider(window.ethereum); // Use connected wallet provider
        let receipt = null;

        while (!receipt) {
            try {
                receipt = await provider.getTransactionReceipt(txHash);
                if (!receipt) {
                    await new Promise(res => setTimeout(res, 3000)); // Wait 3 seconds
                }
            } catch (error) {
                console.warn("⚠️ Error fetching transaction receipt, retrying...", error);
                await new Promise(res => setTimeout(res, 3000));
            }
        }

        // ✅ 3. Fetch Transaction Details and Get Value
        const transaction = await provider.getTransaction(txHash);
        if (!transaction) {
            console.warn("⚠️ Could not fetch transaction details.");
        } else {
            const valueInEth = formatEther(transaction.value);
            paymentData.amountFunded = valueInEth;
            paymentData.txHash = txHash;
        }

        // ✅ 4. Send Payment Data to API
        let response;
        for (let attempt = 1; attempt <= 3; attempt++) {
            try {
                response = await axios.post(`${DATA.origin}/payments`, paymentData, {
                    headers: { Authorization: `Bearer ${TokenManager.getAccessToken()}` }
                });
                console.log("📜 Payment API Response:", response);
                break;
            } catch (error) {
                if (attempt < 3) {
                    console.warn(`🔄 Retrying payment... Attempt ${attempt}`);
                    await new Promise(res => setTimeout(res, 1000 * attempt));
                } else {
                    console.error("❌ Payment API failed after 3 attempts", error);
                    throw error;
                }
            }
        }

        return response;
    } catch (err) {
        if (err.message.includes("No wallet connected")) {
            return "No wallet connected";
        } else if (err.message.includes("user rejected transaction")) {
            return "Payment cancelled";
        } else {
            console.error("🚨 Transaction Failed:", err);
        }

    }
}
