"use client";

import { useState } from "react";
import createPaymentPOST from "@/components/fetchComponents/POST/createPaymentPOST.jsx";
import TokenManager from "@/app/apis/TokenManager";
import { useRouter } from "next/navigation";
import { useSendBalance } from "@dynamic-labs/sdk-react-core";

export default function PaymentButton({ projectId }) {
    const [moneyAmount, setMoneyAmount] = useState("");
    const [isProcessing, setIsProcessing] = useState(false);
    const router = useRouter();
    const { open } = useSendBalance();

    const handlePayment = async () => {
        if (isProcessing) return;

        const claims = TokenManager.getClaims();
        if (!claims) {
            alert("You must be logged in to make a payment.");
            return router.push("/login");
        }

        setIsProcessing(true);

        try {
            const response = await createPaymentPOST({
                projectId,
                backerId: claims.userId,
                //amountFunded: moneyAmount,
                paymentDate: new Date(),
            }, open);

            if (response.status === 200) {
                alert("Payment successful!");
                setMoneyAmount("");
            } else {
                alert("Payment failed, please try again.");
            }
        } catch (error) {
            console.error("Payment error:", error);
            alert("An error occurred while processing your payment.");
        } finally {
            setIsProcessing(false);
        }
    };

    return (
        <div className="flex flex-col items-center space-y-4 w-full">
            <button
                className="w-full px-4 py-3 text-white bg-orange-500 rounded-lg hover:bg-orange-600 text-center font-bold mb-4"
                onClick={handlePayment}
                disabled={isProcessing}
            >
                {isProcessing ? "Processing..." : "Pay"}
            </button>
        </div>

    );
}
