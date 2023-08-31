import java.text.*;

/**
 * A savings account that does not allow withdrawals (except 
 * at the end of the year).
 *
 * @author  Prof. David Bernstein, James Madison University
 * @version 1.0
 */
public class HolidayAccount
{
    private         double           balance;
    private final   int              accountNumber;
    private         NumberFormat     accountFormatter;
    private         String           holder;

    private static  int              nextAccountNumber;


    /**
     * Explicit Value Constructor
     *
     * @param userName   The name of the account holder
     */
    public HolidayAccount(String holder)
    {
       this.holder      = holder;

       accountNumber    = nextAccountNumber;
       nextAccountNumber++;


       accountFormatter = NumberFormat.getInstance();
       accountFormatter.setMinimumIntegerDigits(10);
       accountFormatter.setMaximumIntegerDigits(10);
       accountFormatter.setGroupingUsed(false);

       setBalance(0.0);
    }


    /**
     * Compare the account number on this account to the
     * account number on a given account
     *
     * @param other The given account
     * @return      -1/1 if this account comes before/after the given account
     */
    public int compareTo(HolidayAccount other)
    {
       int       relation;

       relation = 0;
       if (this.accountNumber < other.accountNumber)
       {
          relation = -1;
       } 
       else if (this.accountNumber > other.accountNumber)
       {
          relation = 1;
       }

       return relation;
    }


    /**
     * Deposit money into this account
     *
     * @param amount  The amount of the deposit (should be positive)
     * @return        A message describing the deposit       
     */
    public String deposit(double amount)
    {
       double         temp;
       NumberFormat    moneyFormatter;
       String         message;

       temp = getBalance();
       message = "";
       if (amount <= 0.0) {

          message = "Deposits should be positive.";

       } else {

          moneyFormatter = NumberFormat.getCurrencyInstance();
          message = "Deposited " + moneyFormatter.format(amount);
          temp += amount;
       }

       setBalance(temp);

       return message;
    }


    /**
     * Get the ID associated with this account
     *
     * @return  The ID
     */
    public String getAccountID()
    {
       String        s;

       s = "HA-"+getAccountNumber();

       return s;
    }


    /**
     * Get the number associated with this account
     *
     * @return  The account number
     */
    public String getAccountNumber()
    {
       String        s;

       s = accountFormatter.format(accountNumber);

       return s;
    }


    /**
     * Get the current balance
     *
     * @return   The balance
     */
    public double getBalance()
    {
       return balance;
    }



    /**
     * Get a textual description of the current balance
     *
     * @return   The description of the balance
     */
    public String getBalanceMessage()
    {
       NumberFormat    moneyFormatter;
       String          s;

       moneyFormatter = NumberFormat.getCurrencyInstance();
       s = "Balance: " + moneyFormatter.format(getBalance());

       return s;
    }


    /**
     * Get the name of the account holder
     *
     * @return   The name
     */
    public String getHolder()
    {
       return holder;
    }



    /**
     * Set the current balance
     * Note: This method should be used with caution
     *       (We'll learn how to fix this later)
     *
     * @param balance   The new balance
     */
    public void setBalance(double balance)
    {
       this.balance = balance;
    }


}
