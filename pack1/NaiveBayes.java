package pack1;

import java.io.File;




import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;


public class NaiveBayes {
	String single_quote="no", or="no",sign="no",true1="no",hash="no",double_dash="no",semicolon="no",drop="no",union="no",shutdown="no";
	public int naivePredictor(String args)
	{
		try{
		File myfile=new File ("F:/Eclipseworkspace/DetectionR5/src/pack1/signature.xml");
		DocumentBuilderFactory dFactory = DocumentBuilderFactory.newInstance();
		DocumentBuilder dBuilder = dFactory.newDocumentBuilder();
		Document doc=dBuilder.parse(myfile);
		
		System.out.println("Root element of tree is :"+ doc.getDocumentElement().getNodeName());
		NodeList nodeList =doc.getElementsByTagName("row"); 
		
		extractPattern(args);
	
		
		int totalSamples=nodeList.getLength();
		int classP=0,classN=0;
		System.out.println("Total samples :"+totalSamples);
		int single_n=0,or_n=0,sign_n=0,true1_n=0,hash_n=0,double_dash_n=0,semicolon_n=0,drop_n=0,union_n=0,shutdown_n=0;
		int single_p=0,or_p=0,sign_p=0,true1_p=0,hash_p=0,double_dash_p=0,semicolon_p=0,drop_p=0,union_p=0,shutdown_p=0;

		
		
		for(int i=0; i<totalSamples; i++)
		{
			
			Node currNode = nodeList.item(i);
			if(currNode.getNodeType() == Node.ELEMENT_NODE)
			{
				Element myElement = (Element)currNode;
				String classP_N = myElement.getElementsByTagName("class").item(0).getTextContent();
					if(classP_N.equals("yes"))
						classP++;
					else classN++;
				
				String singleXML=myElement.getElementsByTagName("single_Quote").item(0).getTextContent();
					if(singleXML.equals(single_quote) && classP_N.equals("yes"))
						single_p++;
					else 	if(singleXML.equals(single_quote) && classP_N.equals("no"))
						single_n++;
			
				
				String orXML=myElement.getElementsByTagName("or").item(0).getTextContent();
					if(orXML.equals(or) && classP_N.equals("yes"))
						or_p++;
					else 	if(orXML.equals(or) && classP_N.equals("no"))
						or_n++;
			
				String trueXML=myElement.getElementsByTagName("true").item(0).getTextContent();
					if(singleXML.equals(true1) && classP_N.equals("yes"))
						true1_p++;
					else 	if(trueXML.equals(true1) && classP_N.equals("no"))
						true1_n++;
				
				String signXML=myElement.getElementsByTagName("sign").item(0).getTextContent();
					if(signXML.equals(sign) && classP_N.equals("yes"))
						sign_p++;
					else 	if(signXML.equals(sign) && classP_N.equals("no"))
						sign_n++;
				
				String hashXML=myElement.getElementsByTagName("hash").item(0).getTextContent();
					if(hashXML.equals(hash) && classP_N.equals("yes"))
						hash_p++;
					else 	if(hashXML.equals(hash) && classP_N.equals("no"))
						hash_n++;
					
					
					String doubleXML=myElement.getElementsByTagName("double_Dash").item(0).getTextContent();
					if(doubleXML.equals(double_dash) && classP_N.equals("yes"))
						double_dash_p++;
					else 	if(doubleXML.equals(double_dash) && classP_N.equals("no"))
						double_dash_n++;	
					
					String semiXML=myElement.getElementsByTagName("semicolon").item(0).getTextContent();
					if(semiXML.equals(semicolon) && classP_N.equals("yes"))
						semicolon_p++;
					else 	if(doubleXML.equals(semicolon) && classP_N.equals("no"))
						semicolon_n++;	
					
					String dropXML=myElement.getElementsByTagName("drop").item(0).getTextContent();
					if(dropXML.equals(drop) && classP_N.equals("yes"))
						drop_p++;
					else 	if(dropXML.equals(drop) && classP_N.equals("no"))
						drop_n++;	
					
					String uniXML=myElement.getElementsByTagName("union").item(0).getTextContent();
					if(uniXML.equals(union) && classP_N.equals("yes"))
						union_p++;
					else 	if(uniXML.equals(union) && classP_N.equals("no"))
						union_n++;	
					
					
					String shutXML=myElement.getElementsByTagName("shutdown").item(0).getTextContent();
					if(shutXML.equals(shutdown) && classP_N.equals("yes"))
						shutdown_p++;
					else 	if(shutXML.equals(shutdown) && classP_N.equals("no"))
						shutdown_n++;	
					
					
					
				}	
		}
		/*
		System.out.println(single_p);
		System.out.println(or_p);
		System.out.println(sign_p);
		System.out.println(true1_p);
		System.out.println(hash_p);
		System.out.println(double_dash_p);
		System.out.println(semicolon_p);
		System.out.println(drop_p);
		System.out.println(union_p);
		System.out.println(shutdown_p);

		
		System.out.println(classP);
		
		System.out.println(single_n);
		System.out.println(or_n);
		System.out.println(sign_n);
		System.out.println(true1_n);
		System.out.println(hash_n);
		System.out.println(double_dash_n);
		System.out.println(semicolon_n);
		System.out.println(drop_n);
		System.out.println(union_n);
		System.out.println(shutdown_n);

		
		System.out.println(classP);
		*/
		
		double p_probability=(double)single_p/classP * (double)or_p/classP * (double)sign_p/classP * (double)true1_p/classP * (double)hash_p/classP* (double)double_dash_p/classP * (double)semicolon_p /classP * (double)drop_p/classP * (double)union_p/classP * (double)shutdown_p/classP * (double)classP/totalSamples; 	  
		System.out.println("Probability p "+p_probability);
		double n_probabilty =(double)single_n/classN * (double)or_n/classN * (double)sign_n/classN * (double)true1_n/classN * (double)hash_n/classN* (double)double_dash_n/classN * (double)semicolon_n /classN * (double)drop_n/classN * (double)union_n/classN * (double)shutdown_n/classN * (double)classN/totalSamples; 	  

		System.out.println("Probability n "+n_probabilty);
		if(p_probability>n_probabilty)
		{
			System.out.println("Attack ");
			//Mailer.EmailSending("atmajasahasrabuddhe@gmail.com", "Alert Hacking", "Hacking Alert! Someone is trying to Intrude");
			return 1;
		}
		else 	System.out.println(" No Attack");

		
	}
		
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return 0;
	}
	
	public void extractPattern(String args)
	{
		if(args.contains("'"))
		{
		 single_quote="yes";
		 
		
		}
		if(args.contains("or"))
		{
		 or="yes";
	
		}
		if(args.contains("true"))
		{
		 true1="yes";
		
		}
		if(args.contains("'1'='1")||args.contains("="))
		{
		 sign="yes";
		 System.out.print(sign);
		
		}
		if(args.contains("#"))
		{
		 hash="yes";
		
		}
		if(args.contains(";"))
		{
		 semicolon="yes";
		
		}
		if(args.contains("drop"))
		{
			 drop="yes";
			
		}
		if(args.contains("union"))
		{
			 union="yes";
			
		}
		if(args.contains("shutdown"))
		{
			 shutdown="yes";
			
		}

	}
	public void sent_Mail(int i,String attack)
	{
		if(i==0)
		{
		GlobalFunction gf = new GlobalFunction();
		String ipAddress = gf.getIpAddress();
		String to = "atmajasahasrabuddhe@gmail.com";
		String sub = "Account Hack";
		String msg = "Hacking Alert! Someone is trying to intrude in System with IP Address :"+ ipAddress;
		Mailer.EmailSending(to, sub, msg);
		}
		else
		{
			GlobalFunction gf = new GlobalFunction();
			String ipAddress = gf.getIpAddress();
			String to = "atmajasahasrabuddhe@gmail.com";
			String sub = "Account Hack";
			String msg = "Hacking Alert! Someone has intruded and trying to perform "+attack+" in the System  with IP Address :"+ ipAddress;
			Mailer.EmailSending(to, sub, msg);
		}
		//Mailer.EmailSending(uname, sub, msg);
	}
	
	
}
