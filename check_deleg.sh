#!/bin/bash

# Setting up variables
DESTINATION_NODE_DELEGATION="bbnvalopers0" # Delegation Node address
AMOUNT_SEND="1000000" # ubbn
AMOUNT_FEES_DELEGATION_TX="1000ubbn"
WALLET_ADDRESS_FROM="bbn1fuspxl8q7hlt" # Address sender (public wallet address)

# Colors for debug messages
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Enable dry run mode if requested
DRY_RUN=false
if [ "$1" == "--dry-run" ]; then
    DRY_RUN=true
    echo -e "${YELLOW}Dry Run mode activated. No commands will be executed.${NC}"
fi

echo -e "${GREEN}Checking balance for address ${WALLET_ADDRESS_FROM}...${NC}"

# Execute command to get balances
balance_output=$(babylond q bank balances "$WALLET_ADDRESS_FROM")

# Check if the amount is equal to or greater than AMOUNT_SEND
if [[ $balance_output == *"amount: \""* && $(echo $balance_output | grep -oP 'amount: "\K\d+') -ge $AMOUNT_SEND ]]; then
    echo -e "${GREEN}Balance is sufficient for delegation.${NC}"
    
    # Build command for delegation
    delegate_cmd="babylond tx epoching delegate $DESTINATION_NODE_DELEGATION ${AMOUNT_SEND}ubbn --from $WALLET_ADDRESS_FROM --chain-id bbn-test-2 --fees=$AMOUNT_FEES_DELEGATION_TX -y"
    
    if $DRY_RUN; then
        echo -e "${YELLOW}Dry Run: $delegate_cmd${NC}"
    else
        echo -e "${GREEN}Executing: $delegate_cmd${NC}"
        eval "$delegate_cmd"
    fi
else
    echo -e "${RED}Insufficient balance for delegation or balance not accessible.${NC}"
fi
