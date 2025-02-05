import "./globals.css";
import { DATA } from "@/app/data";
import { Toaster } from "@/components/ui/toaster";
import { WebSocketProvider } from "@/components/generalComponents/WebSocketContext";
import { DynamicContextProvider } from "@dynamic-labs/sdk-react-core";
import { EthereumWalletConnectors } from "@dynamic-labs/ethereum";

import { evmNetworks } from "@/config/config";


export const metadata = {
  title: DATA.projectName,
  description: "Crowdfunding page",
};

export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>
        <DynamicContextProvider
          settings={{
            environmentId: "07bc92f7-a550-4843-b12b-394a7f6684bd",
            walletConnectors: [EthereumWalletConnectors],
            overrides: { evmNetworks }
          }}
        >
          <WebSocketProvider>
            {children}
            <Toaster />
          </WebSocketProvider>
        </DynamicContextProvider>

      </body>
    </html>
  );
}
