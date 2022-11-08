// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

import "./Itest.sol";

contract Test is ITest, Initializable, OwnableUpgradeable {
    function initialize(address payable _owner, string memory _name, string memory _symbol) public initializer {
        deployer = _owner;
        name = _name;
        symbol = _symbol;
        __Context_init_unchained();
        __Ownable_init_unchained();
    }

    string public name;
    string public symbol;
    address public deployer;
    uint256 public num;

    event SetNum(uint256 _num);

    function setNum(uint256 _num) public override {
        num = _num + 2;
    }
}
