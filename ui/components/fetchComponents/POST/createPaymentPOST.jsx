import axios from "axios";
import { DATA } from "@/app/data";
import TokenManager from "@/app/apis/TokenManager";
import { useSendBalance } from "@dynamic-labs/sdk-react-core";
import { parseEther } from "ethers";




export default async function createPaymentPOST(paymentData, open) {


    console.log("1")

    console.log("paymentData", paymentData)

    try {
        const tx = await open({
            recipientAddress: "0xe4f1638f1E34dF36D0B3523b4402A89F1478f0B1", // Replace with actual address
            value: parseEther("0.000000001"),
        });
        console.log("Transaction Sent:", tx);

        const response = await axios.post(`${DATA.origin}/payments`,
            paymentData,
            {
                headers: { Authorization: `Bearer ${TokenManager.getAccessToken()}` }
            }
        );

        console.log(response)

        return response;

    } catch (err) {
        console.error("Transaction Failed:", err);
    }

    console.log("2")



}
