"use client";
import { useState, useEffect } from "react";
import { DynamicWidget, useIsLoggedIn, useDynamicContext, useSendBalance } from "@dynamic-labs/sdk-react-core";
import PageFrame from "@/components/generalComponents/pageFrame/PageFrame";
import { parseEther } from "ethers";
import createPaymentPOST from "@/components/fetchComponents/POST/createPaymentPOST";

export default function DemoPage() {
    const isLoggedIn = useIsLoggedIn();
    const { primaryWallet } = useDynamicContext();
    const { open } = useSendBalance();
    const [balance, setBalance] = useState(null);


    const paymentData = {
        projectId: 1,
        backerId: 1,
        amountFunded: 10,
        paymentDate: new Date(),
    };

    // Fetch Balance in useEffect
    useEffect(() => {
        const fetchBalance = async () => {
            if (primaryWallet) {
                const walletBalance = await primaryWallet.getBalance();
                setBalance(walletBalance);
            }
        };

        fetchBalance();
    }, [primaryWallet]);

    // Send ETH Transaction
    const onClickSend = async () => {
        try {
            const tx = await open({
                recipientAddress: "0xe4f1638f1E34dF36D0B3523b4402A89F1478f0B1", // Replace with actual address
            });
            console.log("Transaction Sent:", tx);
        } catch (err) {
            console.error("Transaction Failed:", err);
        }
    };

    return (
        <PageFrame>
            <div>
                <h1>Demo Page</h1>
            </div>

            <div>
                {isLoggedIn ? (
                    <p>✅ You are logged in!</p>
                ) : (
                    <p>❌ Please log in to continue.</p>
                )}
            </div>


            <p><strong>Wallet Balance:</strong> {balance || "aa" ? `${balance || "bb"} ETH` : "Loading..."}</p>



            <button onClick={() => createPaymentPOST(paymentData, open)} className="bg-blue-500 text-white px-4 py-2 rounded-lg"> Send transaction</button>
        </PageFrame>
    );
}
