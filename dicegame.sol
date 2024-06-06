// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DiceGame {
    address public  owner;
    uint256 public minimumBet;
    uint256 public totalBet;
    uint256 public numberOfBets;
    uint256 public maxNumberOfBets = 10;
    uint256 public randomNumber;
    address payable[] public players;

    struct Player {
        uint256 amountBet;
        uint256 numberSelected;
    }

    mapping(address => Player) public playerInfo;

    constructor(uint256 _minimumBet) {
        owner = msg.sender;
        minimumBet = _minimumBet;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function.");
        _;
    }

    modifier maxNumberOfBetsReached() {
        require(numberOfBets < maxNumberOfBets, "Maximum number of bets reached.");
        _;
    }

    function bet(uint256 _numberSelected) public payable maxNumberOfBetsReached {
        require(msg.value >= minimumBet, "Insufficient bet amount.");
        playerInfo[msg.sender].amountBet = msg.value;
        playerInfo[msg.sender].numberSelected = _numberSelected;
        players.push(payable(msg.sender));
        totalBet += msg.value;
        numberOfBets++;
    }

    function generateRandomNumber() private view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty))) % 6 + 1;
    }

    function distributePrizes() public onlyOwner {
        require(numberOfBets == maxNumberOfBets, "Not all bets are placed yet.");
        require(totalBet > 0, "No bets placed.");

        randomNumber = generateRandomNumber();
        address payable winner;
        uint256 totalWon = 0;

        for (uint256 i = 0; i < players.length; i++) {
            address payable playerAddress = players[i];
            if (playerInfo[playerAddress].numberSelected == randomNumber) {
                winner = playerAddress;
            }
            delete playerInfo[playerAddress];
        }

        if (winner != address(0)) {
            uint256 amountWon = totalBet;
            totalWon += amountWon;
            winner.transfer(amountWon);
        }

        totalBet = 0;
        delete players;
        numberOfBets = 0;
    }

    function withdraw()public  onlyOwner{
        payable(owner).transfer(address(this).balance);
    }
}