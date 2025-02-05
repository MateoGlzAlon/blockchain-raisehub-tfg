"use client";
import { useState, useEffect } from "react";
import { DynamicWidget, useIsLoggedIn, useDynamicContext, useSendBalance } from "@dynamic-labs/sdk-react-core";
import PageFrame from "@/components/generalComponents/pageFrame/PageFrame";
import { parseEther } from "ethers";

export default function DemoPage() {
    const isLoggedIn = useIsLoggedIn();
    const { primaryWallet } = useDynamicContext(); // Get wallet info
    const { open } = useSendBalance();
    const [balance, setBalance] = useState(null);

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
                recipientAddress: "0x123456789abcdef...", // Replace with actual address
                value: parseEther("0.01"), // Adjust amount
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

            <button onClick={onClickSend} className="bg-blue-500 text-white px-4 py-2 rounded-lg">
                Send ETH
            </button>

            <p><strong>Wallet Balance:</strong> {balance || "aa" ? `${balance || "bb"} ETH` : "Loading..."}</p>
        </PageFrame>
    );
}
