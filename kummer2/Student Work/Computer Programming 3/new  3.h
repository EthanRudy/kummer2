	case 5:
		//Simple Interest Calculator
		float Principal;
		float InterestRate;
		float AmountTime;
		float FinalAmount;
		cout<<"Simple Interest Calculator"<<"\n";
		cout<<"--------------------------"<<"\n"<<"\n";
		cout<<"Enter the principal:   ";
		cin>>Principal;
		cout<<"\n"<<"Enter the interest rate (%):   ";
		cin>>InterestRate;
		InterestRate = InterestRate * 0.1;
		cout<<"\n"<<"Enter the amount of times (in years):   ";
		cin>>AmountTime;
		cout<<"\n"<<"\n";
		FinalAmount = Principal * InterestRate * AmountTime;
		cout<<"There will be $"<<FinalAmount<<" at the end of "<<AmountTime<<" years."<<"\n";
		system("pause");
		system("CLS";
		break;
	
	
	case 6:
		//Resistor Calculator
		float Resistance;
		float VoltsIn;
		float AmpsOut;
		cout<<"Resistance Calculator"<<"\n";
		cout<<"--------------------------"<<"\n";
		cout<<"Enter the resistance in Ohms:   ";
		cin<<Resistance;
		cout<<"\n"<<"Enter the current voltage:   ";
		cin<<VoltsIn;
		AmpsOut = Volts/Resistance;
		cout<<"\n"<<"The original current is "<<AmpsOut<<" amps."<<"\n";
		system("pause");
		system("CLS");
		break;