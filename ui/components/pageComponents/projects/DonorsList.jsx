"use client";

import { useEffect, useState } from "react";
import { cn } from "@/lib/utils";
import { AnimatedList } from "@/components/magicui/animated-list";
import { format } from 'date-fns';
import fetchDonationsListData from "@/components/fetchComponents/GET/fetchDonationsListData";

const Notification = ({ backerName, amount, paymentDate, txHash }) => {
    const handleRedirect = () => {
        if (txHash) {
            window.open(`https://sepolia.etherscan.io/tx/${txHash}`, "_blank");
        }
    };

    const formattedAmount = Number(amount) < 0.000001
        ? "<0.000001"
        : Number(amount).toLocaleString("en-US", {
            minimumFractionDigits: 0,
            maximumFractionDigits: 6,
            useGrouping: false,
        });

    return (
        <figure
            id="donation-notification"
            className={cn(
                "relative mx-auto min-h-fit w-full cursor-pointer overflow-hidden rounded-2xl p-2 border-[1px]",
                "transition-all duration-1000 ease-in-out hover:bg-gray-200",
                "bg-white dark:bg-transparent dark:backdrop-blur-md dark:border dark:border-opacity-10"
            )}
            onClick={handleRedirect}
        >
            <div className="flex items-center gap-3 ">
                <div className="flex items-center justify-center size-10 rounded-2xl p-2">
                    <img src="/eth-logo.svg" alt="icon" className="object-cover" />
                </div>
                <div className="flex flex-col overflow-hidden">
                    <figcaption className="text-base font-medium dark:text-white">
                        <span>{formattedAmount} ETH</span>
                        <span className="mx-1">·</span>
                        <span>{backerName}</span>
                    </figcaption>
                    <p className="text-sm font-normal dark:text-white/60">
                        {format(new Date(paymentDate), 'dd/MM/yyyy')}
                    </p>
                </div>
            </div>
        </figure>
    );
};

export function DonorsList({ className, projectId }) {
    const [donations, setDonations] = useState([]);

    useEffect(() => {
        const fetchData = async () => {
            if (projectId) {
                const data = await fetchDonationsListData(projectId);
                setDonations(data);
            }
        };
        fetchData();
    }, [projectId]);

    return (
        <div className={cn("relative flex h-full w-full flex-col overflow-hidden rounded-lg bg-background", className)}>
            <AnimatedList>
                {donations.map((item, idx) => (
                    <Notification {...item} key={idx} />
                ))}
            </AnimatedList>
        </div>
    );
}
