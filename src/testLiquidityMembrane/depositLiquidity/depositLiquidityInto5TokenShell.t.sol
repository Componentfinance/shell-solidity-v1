
pragma solidity ^0.5.6;

import "ds-test/test.sol";
import "ds-math/math.sol";

import "../../Prototype.sol";
import "../../ERC20Token.sol";
import "../../testSetup/setupShells.sol";

contract DappTest is DSTest, DSMath, ShellSetup {
    address shell;

    function setUp() public {

        setupPool();
        setupTokens();
        shell = setupShellABCDE();

    }

    function testDepositLiquidityTo5TokenShell () public {

        uint256 amountToStake = 500 * WAD;
        pool.depositLiquidity(shell, amountToStake);

    }

}