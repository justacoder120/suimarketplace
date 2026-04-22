# 🛒 SUI Marketplace

A high-performance, decentralized marketplace built on the **Sui Blockchain**. This platform allows users to create, list, buy, and battle unique Hero NFTs in a secure and transparent environment.

## 🚀 Features

- **Hero Creation**: Mint unique Hero NFTs with custom names, images, and power levels.
- **Marketplace Listing**: List your heroes for sale at your desired price in SUI.
- **Instant Trading**: Securely buy heroes listed by other users.
- **Battle Arena**: Challenge other players in the arena. The winner takes both heroes!
- **Admin Controls**: Powerful administrative tools for marketplace management, including delisting and price adjustments.

## 🛠️ Technology Stack

- **Smart Contracts**: Move Language (Sui Framework)
- **Frontend**: React / Next.js with Sui TS SDK
- **Blockchain**: Sui Network (Devnet/Testnet)

## 📋 Prerequisites

Before you begin, ensure you have the following installed:
- [Sui Binaries](https://docs.sui.io/guides/developer/getting-started/sui-install)
- [Node.js & npm](https://nodejs.org/)
- A Sui Wallet (e.g., Sui Wallet, Ethos, or Martian)

## 📦 Getting Started

### 1. Smart Contract Setup

Navigate to the `move` directory to build and test the smart contracts:

```bash
cd move
sui move build
sui move test
```

To publish the contracts to the network:

```bash
sui client publish --gas-budget 100000000
```

### 2. Frontend Configuration

After publishing, update the `PACKAGE_ID` in `ui/src/networkConfig.ts` with your new package ID.

Install dependencies and start the development server:

```bash
cd ui
npm install
npm run dev
```

The application will be available at `http://localhost:5173` (or your local dev port).

## 🎮 How to Play

1. **Mint a Hero**: Go to the "Create" section and mint your first hero.
2. **List for Sale**: Head to your inventory and list a hero on the marketplace.
3. **Battle**: Visit the Arena, select a hero, and challenge an existing arena listing.
4. **Win**: Winners of battles receive both their hero and the opponent's hero!

## ⚠️ Admin Operations

Users with the `AdminCap` can:
- **Delist Items**: Remove any listing from the marketplace.
- **Update Prices**: Adjust the price of any listed hero.
- **Transfer Admin**: Pass administrative control to another address.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License.