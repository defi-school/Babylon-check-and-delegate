# Babylon check wallet  and delegate


![defi-school io_](https://github.com/defi-school/Babylon-check-and-delegate/assets/10072713/0c0cbf91-20fa-46c8-860e-956b86738318)

> [!NOTE]
>Script related to : https://babylonchain.io/ Bitcoin Staking Protocol <br>
>Defi-school is not affiliated with or connected to babylonchain.io.

Script to check your balance and send it to a delegation node if it's greater than an amount of your choice

## Installation Guide

Download the script to the same server where "babylond" and the wallet are registered.
### Step 1: Open Terminal
### Step 2: Clone project
```bash
git clone https://github.com/defi-school/Babylon-check-and-delegate.git
cd ./Babylon-check-and-delegate.git
```

### Step 3: Edit the beginning of the script

```bash
DESTINATION_NODE_DELEGATION="bbnvalopers0" #Delegation Node address
AMOUNT_SEND="1000000"# ubbn
AMOUNT_FEES_DELEGATION_TX="1000ubbn"
WALLET_ADDRESS_FROM="bbn1fuspxl8q7hlt" # Address send ubbn
```

### Step 4: Make the Script Executable
```bash
chmod +x check_deleg.sh
```
### Step 5: Run the Script test mode
```bash
./check_deleg.sh --dry-run 
```
### Step 6: Run the Script in production mode
```bash
./check_deleg.sh 
```
