package pack1;

public class Sign_Compare {
	
	public void sig_Compare(String input)
	{
		NaiveBayes n=new NaiveBayes();
		if (input.contains("'1'='1")|| input.contains("TRUE#")||input.contains("true#"))
		{
			//Mailer.EmailSending(To, Sub, Msg)
			
			n.sent_Mail(1,"Tautology");
		}
		else if(input.contains("'or''='")||input.contains("'#"))
		{
			n.sent_Mail(1, "Second order Injection" );
		}
		else if(input.contains("; drop table"))
		{
			n.sent_Mail(1, "piggybacking");
		}
	}
}
