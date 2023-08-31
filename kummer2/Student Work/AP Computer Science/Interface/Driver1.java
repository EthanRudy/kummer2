import java.util.*;

/**
 * A driver for experimenting with the HolidayAccount
 * class and the Comparable interface
 */
public class Driver1
{
    /**
     * The entry point
     *
     * @param args   The command-line arguments
     */
    public static void main(String[] args)
    {
	HolidayAccount[]          accounts;
	int                       i, size;
	String                    name;


	size = 4;

	// Construct the accounts
	accounts = new HolidayAccount[size];
	for (i=accounts.length-1; i >= 0; i--)
	{
	    name = "user"+i;
	    accounts[i] = new HolidayAccount(name);
	}

	// Print the accounts in the original order
	for (i=0; i < accounts.length; i++)
	{
	    System.out.println(accounts[i].getAccountID()+"\t"+
			       accounts[i].getHolder());
	}

	System.out.println("\n\n");

    }

}
