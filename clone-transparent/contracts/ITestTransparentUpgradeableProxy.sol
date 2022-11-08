// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

interface ITestTransparentUpgradeableProxy {
    function initialize(
        address _logic,
        address admin_,
        bytes memory _data,
        address payable _owner,
        string memory _name,
        string memory _symbol
    ) external;
}
