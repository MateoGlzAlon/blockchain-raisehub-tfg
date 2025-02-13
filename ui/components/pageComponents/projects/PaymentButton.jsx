"use client";

import { useState } from "react";
import createPaymentPOST from "@/components/fetchComponents/POST/createPaymentPOST.jsx";
import TokenManager from "@/app/apis/TokenManager";
import { useRouter } from "next/navigation";
import { useSendBalance } from "@dynamic-labs/sdk-react-core";

export default function PaymentButton({ projectId, creatorWallet }) {
    const [moneyAmount, setMoneyAmount] = useState("");
    const [isProcessing, setIsProcessing] = useState(false);
    const [notification, setNotification] = useState(null);
    const router = useRouter();
    const { open } = useSendBalance();

    const showNotification = (message, type) => {
        setNotification({ message, type });
        setTimeout(() => setNotification(null), 8000);
    };

    const handlePayment = async () => {
        if (isProcessing) return;

        const claims = TokenManager.getClaims();
        if (!claims) {
            showNotification("You must be logged in to make a payment.", "error");
            return router.push("/login");
        }

        setIsProcessing(true);

        console.log("CreatorWallet paymentButton : ", creatorWallet);

        try {
            const response = await createPaymentPOST(
                {
                    projectId,
                    backerId: claims.userId,
                    paymentDate: new Date(),
                },
                open,
                creatorWallet
            );

            console.log("response : ", response);

            if (response?.status === 200) {
                showNotification("Payment successful!", "success");
                setMoneyAmount("");
            } else if (response === "No wallet connected") {
                showNotification("No wallet connected", "error");
            } else if (response === "Payment cancelled") {
                showNotification("Payment cancelled", "error");
            } else {
                showNotification("Payment failed, please try again.", "error");
            }
        } catch (error) {
            console.error("Payment error:", error);
            showNotification("An error occurred while processing your payment.", "error");
        } finally {
            setIsProcessing(false);
        }
    };

    return (
        <div className="flex flex-col items-center space-y-4 w-full relative">
            {notification && (
                <div className={`z-50 fixed bottom-5 right-5 px-4 py-3 rounded-lg shadow-lg text-white ${notification.type === "success" ? "bg-green-500" : "bg-red-500"}`}>
                    {notification.message}
                </div>
            )}
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
