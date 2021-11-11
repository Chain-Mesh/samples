const Register = artifacts.require("sidemesh-solidity/resource/Register.sol");
const Verifier = artifacts.require("sidemesh-solidity/resource/Verifier.sol");
const Sidemesh = artifacts.require("sidemesh-solidity/sidemesh/Sidemesh.sol");
const LockManager = artifacts.require("sidemesh-solidity/lock/LockManager.sol");
const GlobalTransactionManager = artifacts.require(
	"sidemesh-solidity/transaction/GlobalTransactionManager.sol"
);
const VerifierRegistery = artifacts.require("./VerifierRegistery.sol");
const ResourceRegistery = artifacts.require("./ResorceRegistery.sol");
const CrossPrimary = artifacts.require("./CrossPrimary.sol");
// const CrossNetwork = artifacts.require("./CrossNetwork.sol");

module.exports = async function (deployer) {
	const register = await Register.deployed();
	await deployer.deploy(ResourceRegistery, register.address);

	const verifier = await Verifier.deployed();
	await deployer.deploy(VerifierRegistery, verifier);

	const sidemesh = await Sidemesh.deployed();
	const lockManager = await LockManager.deployed();
	const globalTransactionManager = await GlobalTransactionManager.deployed();

	await deployer.deploy(
		CrossPrimary,
		sidemesh.address,
		lockManager.address,
		globalTransactionManager.address
	);

	// await deployer.deploy(
	// 	CrossNetwork,
	// 	sidemesh.address,
	// 	lockManager.address,
	// 	globalTransactionManager.address
	// );
};
