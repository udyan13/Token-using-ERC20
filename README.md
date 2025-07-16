# AkaINU Token & TokenSale Smart Contracts

![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)

This repository contains two smart contracts written in Solidity:

1. **`AkaINU.sol`** — An ERC-20 token contract using OpenZeppelin with minting, burning, and access control features.
2. **`TokenSale.sol`** — A simple token sale contract where users can purchase AkaINU tokens using Ether (ETH).

---

## 🪙 Features

### AkaINU Token
- ✅ ERC-20 compatible
- ✅ Minting with `MINTER_ROLE` using `AccessControl`
- ✅ Burning via `BuyaAkaINU()` and `BuyAkaINUFrom()`
- ✅ Allowance management: `increaseAllowance()` and `decreaseAllowance()`
- ✅ Emits `AkaINUpurchased` event on token consumption

### TokenSale
- ✅ Simple token sale at a fixed price (1 token = 1 ETH)
- ✅ Accepts ETH and transfers AkaINU tokens to buyers
- ✅ Refunds leftover ETH if overpaid

---

## 🧪 How to Deploy & Use in Remix

### Step 1: Open Remix
Go to [https://remix.ethereum.org](https://remix.ethereum.org)

### Step 2: Create Contract Files
- In the `contracts` folder, create two files:
  - `Token.sol` — Paste your AkaINU contract code here
  - `TokenSale.sol` — Paste your TokenSale contract code here

### Step 3: Compile Contracts
- Open the **Solidity Compiler** tab.
- Select compiler version:
  - Use **0.8.27** for `Token.sol`
  - Use **0.8.16** for `TokenSale.sol`
- Click **Compile** on both contracts.

### Step 4: Deploy AkaINU
- Go to the **Deploy & Run Transactions** tab.
- Select `AkaINU` from the contract dropdown.
- Deploy it.
- Copy the deployed AkaINU token address.

### Step 5: Deploy TokenSale
- Select `TokenSale` from the contract dropdown.
- Paste the AkaINU token address into the constructor field.
- Deploy `TokenSale`.

### Step 6: Mint Tokens
In the deployed AkaINU contract, call:
```solidity
mint(<your_wallet_address>, 1000)
```
This mints 1000 AIN tokens to your address (adjust the amount as needed).

### Step 7: Approve TokenSale to Spend Tokens
In the AkaINU contract, approve the TokenSale contract to spend your tokens:
```solidity
approve(<TokenSale_address>, <amount_to_allow>)
```

### Step 8: Purchase Tokens
In the TokenSale contract, call:
```solidity
purchaseAkaINU()
```
Make sure to send ETH with the transaction. Tokens will be transferred to your address, and any extra ETH will be refunded.

---

## ⚠️ Notes

- You must mint tokens to the token owner address before they can be sold.
- The token sale works on a fixed price basis: 1 AkaINU = 1 ETH.
- Contract uses `decimals()` to properly scale token amounts (default is 18 decimals).
- Refunds use `.call()` instead of `.transfer()` for safety and gas flexibility.

---

## 🛡 Security Tips

- Make sure to test `approve()` and `purchaseAkaINU()` flow carefully.
- Only the token owner can sell tokens — buyers cannot mint.
- Add `withdraw()` function to TokenSale if you want to collect ETH later (optional enhancement).

---

## 📄 License

This project is licensed under the [MIT License](./LICENSE).

---

## 👤 Author

Developed by **[Udyan Gahatraj](https://github.com/udyan13)**  
Feel free to ⭐ the repo and share feedback!
