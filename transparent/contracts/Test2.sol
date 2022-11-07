// SPDX-License-Identifier: MIT

pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract Test2 is Initializable, OwnableUpgradeable {
    function initialize() public initializer {
        __Context_init_unchained();
        __Ownable_init_unchained();
    }

    uint256 public num;

    event SetNum(uint256 _num);

    function setNum(uint256 _num) public {
        num = _num - 2;
    }
}
