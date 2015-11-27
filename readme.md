**A system of contracts designed to simulate some of the behaviour of various securities**

The basis contract is security.sol this is where balances are controlled and the issuer is able to add various corporate actions, dividends etc.. And the owner of the securities is able to transfer them to others.

The main difference between this contract and a standard 'coin' is the addition of a 'state' to the balance mapping. This is how the system keeps track of whether a dividend has been paid, a stock split processed etc...

The Issuer of the security is able to attach special 'corpact' contracts which have the ability to modify the balances, and move the securities from one 'state' to another.

The securityregistry.sol is a registry where all the securities are listed.

**ToDo:**

Add the ability to book, match and settle.

Add the ability to pay dividends in arbritrary currencies.
