// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "@openzeppelin/contracts/proxy/transparent/TransparentUpgradeableProxy.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "./ITestTransparentUpgradeableProxy.sol";

contract TestTransparentUpgradeableProxy is
    ITestTransparentUpgradeableProxy,
    TransparentUpgradeableProxy,
    Initializable
{
    constructor(
        address _logic,
        address admin_,
        bytes memory _data
    ) TransparentUpgradeableProxy(_logic, admin_, _data) {}

    function initialize(
        address _logic,
        address admin_,
        bytes memory _data,
        address payable _owner,
        string memory _name,
        string memory _symbol
    ) public initializer {
        deployer = _owner;
        name = _name;
        symbol = _symbol;
        new TransparentUpgradeableProxy(_logic, admin_, _data);
    }

    address public deployer;
    string public name;
    string public symbol;
}
