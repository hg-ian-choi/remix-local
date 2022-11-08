// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "./ITestTransparentUpgradeableProxy.sol";
import "@openzeppelin/contracts/proxy/Clones.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TestFactory is Ownable {
    using Clones for address;

    address public origin;

    event NewClone(address _newClone, address _owner);

    constructor() {}

    function setOrigin(address _origin) public onlyOwner {
        origin = _origin;
    }

    function _clone(
        address _logic,
        address admin_,
        bytes memory _data,
        address payable _owner,
        string memory _name,
        string memory _symbol
    ) external returns (address newAddress) {
        newAddress = origin.cloneDeterministic(
            _getSalt(msg.sender, keccak256(abi.encode(_name, _symbol)))
        );
        ITestTransparentUpgradeableProxy(newAddress).initialize(_logic, admin_, _data, payable(_msgSender()), _name, _symbol);
        emit NewClone(newAddress, msg.sender);
    }

    function _getSalt(address _creator, bytes32 _nonce)
        public
        pure
        returns (bytes32)
    {
        return bytes32(uint256(uint160(_creator))) | _nonce;
    }
}
