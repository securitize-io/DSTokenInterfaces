## DS Protocol Interfaces

This repository includes the smart contracts defining the main interfaces required by the [DS Protocol][ds-protocol],
as well as the [ABIs (Application Binary Interfaces)][abi] that facilitate interacting with them. They are:

* [DSServiceConsumerInterface ](contracts/dsprotocol/service/DSServiceConsumerInterface.sol):  The basic fabric of
the DS Protocol, allowing the different components to be able to associate with each other dynamically.

* [DSTokenInterface ](contracts/dsprotocol/token/DSTokenInterface.sol):  The interface defining the DS Token itself,
an extension of the ERC20 standard, but including additional mechanisms relevant for Digital Securities,
like investor-centric balances or the capability of iterating through the wallets holding tokens.

* [DSTrustServiceInterface ](contracts/dsprotocol/trust/DSTrustServiceInterface.sol):  The interface for the Trust Service,
which allows assigning trust roles in the context of a DS Token, so that authorized actors or DS Apps can appropriately
interact with the rest of the services.

* [DSRegistryServiceInterface ](contracts/dsprotocol/registry/DSRegistryServiceInterface.sol):  This interface defines
the functions for the Registry Service, which holds the relevant information about investors to ensure compliance during
issuance or trades, but also to keep their privacy.

* [DSComplianceServiceInterface](contracts/dsprotocol/compliance/DSComplianceServiceInterface.sol):  This is the interface
the DS Token will rely on to ensure the validation of the different operations of issuance and trade during its lifecycle.

You can find more information in our [Medium post][medium-post].

[abi]: https://en.wikipedia.org/wiki/Application_binary_interface
[ds-protocol]: https://medium.com/securitize/introducing-ds-digital-securities-protocol-securitizes-digital-ownership-architecture-for-4bcb6a9c4a16
[medium-post]: https://medium.com/securitize/ds-protocol-interfaces-released-7470e4d45ae6
