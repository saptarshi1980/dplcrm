package in.net.dpl.controller;

import in.net.dpl.dao.BillDAO;
import in.net.dpl.dao.PaymentRequestDAO;
import in.net.dpl.dao.TariffDAO;
import in.net.dpl.dao.UserDAO;
import in.net.dpl.model.PaymentRequest;
import in.net.dpl.model.Tariff;
import in.net.dpl.model.TenderModel;
import in.net.dpl.model.Unique;
import in.net.dpl.model.User;
import in.net.dpl.utility.ChecksumBillDesk;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@Controller

public class NavigationController{
	@RequestMapping(value="/index.dpl",method = RequestMethod.GET)
	public ModelAndView index(HttpServletRequest request){
 
		request.getSession().invalidate();
		ModelAndView model = new ModelAndView("index"); 
		return model;
	}
	
	@RequestMapping(value="/reset.dpl",method = RequestMethod.GET)
	public ModelAndView reset(HttpServletRequest request){
 
		
		ModelAndView model = new ModelAndView("reset"); 
		return model;
	}
	
	@RequestMapping(value="/forgot.dpl",method = RequestMethod.GET)
	public ModelAndView forgot(HttpServletRequest request){
 
		
		ModelAndView model = new ModelAndView("forgot"); 
		return model;
	}
	
	@RequestMapping(value="/home.dpl",method = RequestMethod.GET)
	public ModelAndView home(@RequestParam("con_no") String con_no,HttpServletRequest request){
 
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
		UserDAO udao=(UserDAO) ctx.getBean("udao");
    	User user=udao.userLoginAuthWithoutPassword(con_no);
    	ModelAndView model = new ModelAndView("userHome");
		model.addObject("user",user);
		return model;
	}
	
	@RequestMapping(value = "checkUser.dpl", method = RequestMethod.GET)
	public @ResponseBody String findTender(@RequestParam("username") String user_name) {
		
    	System.out.println("Inside Check User");
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
    	UserDAO udao=(UserDAO) ctx.getBean("udao");
    	int count=udao.checkUser(user_name);
    	return String.valueOf(count);
	}
	
	@RequestMapping(value="/finalgateway.dpl",method = RequestMethod.POST)
	public ModelAndView finalgateway(){
 
		ModelAndView model = new ModelAndView("finalgateway"); 
		return model;
	}
	
	@RequestMapping(value="/NewUser.dpl",method = RequestMethod.GET)
	public ModelAndView newUser(){
 
		ModelAndView model = new ModelAndView("userRegistration"); 
		return model;
	}
	
	@RequestMapping(value="/billSelect.dpl",method = RequestMethod.GET)
	public ModelAndView billPeriod(@RequestParam("con_no") String con_no,HttpServletRequest request){
 
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
		BillDAO bdao=(BillDAO) ctx.getBean("bdao");
		List<String> billList=bdao.billList(con_no);
		request.setAttribute("billMonth", billList);
		ModelAndView model = new ModelAndView("billPeriodSelector"); 
		return model;
	}
	
	@RequestMapping(value="/billFetch.dpl",method = RequestMethod.GET)
	public ModelAndView billInfoFetch(@RequestParam("con_no") String con_no,HttpServletRequest request){
		
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
    	PaymentRequestDAO pdao=(PaymentRequestDAO) ctx.getBean("pdao");
		System.out.println(con_no);
		List<PaymentRequest> pr=pdao.billList(con_no);
		
		if(pr.size()>0){
			ModelAndView model = new ModelAndView("paymentPageFirst"); 
			model.addObject("pr",pr);
			System.out.println(pr.size());
			return model;
		}
		else{
			
			UserDAO udao=(UserDAO) ctx.getBean("udao");
	    	User user=udao.userLoginAuthWithoutPassword(con_no);
	    	request.setAttribute("msg", "No Pending bill for payment / Due Date expired");
	    	ModelAndView model = new ModelAndView("userHome");
    		model.addObject("user",user);
    		return model;
		}
	}
	
	@RequestMapping(value="/quickPayHandler.dpl",method = RequestMethod.POST)
	public ModelAndView quickPayHandler(@RequestParam("con_no") String con_no,HttpServletRequest request){
		
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
    	PaymentRequestDAO pdao=(PaymentRequestDAO) ctx.getBean("pdao");
		System.out.println(con_no);
		List<PaymentRequest> pr=pdao.billList(con_no);
		
		if(pr.size()>0){
			ModelAndView model = new ModelAndView("paymentPageFirst"); 
			model.addObject("pr",pr);
			System.out.println(pr.size());
			return model;
		}
		else{
			
			request.setAttribute("msg", "No Pending bill for payment / Due Date expired");
	    	ModelAndView model = new ModelAndView("noBill");
    		return model;
		}
	}
	
	@RequestMapping(value="/appPayHandler.dpl",method = RequestMethod.GET)
	public ModelAndView appkPayHandler(@RequestParam("con_no") String con_no,HttpServletRequest request){
		
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
    	PaymentRequestDAO pdao=(PaymentRequestDAO) ctx.getBean("pdao");
		System.out.println(con_no);
		List<PaymentRequest> pr=pdao.billList(con_no);
		
		if(pr.size()>0){
			ModelAndView model = new ModelAndView("paymentPageFirst"); 
			model.addObject("pr",pr);
			System.out.println(pr.size());
			return model;
		}
		else{
			
			request.setAttribute("msg", "No Pending bill for payment / Due Date expired");
	    	ModelAndView model = new ModelAndView("noBill");
    		return model;
		}
	}
	
	@RequestMapping(value="/PayBillHandler.dpl",method = RequestMethod.GET)
	public ModelAndView paybillHandler(@RequestParam("token") String token,HttpServletRequest request){
		
		
		String ChecksumKey ="a3VkNtgWZNwu";
		String[] value_split = token.split("\\|");
		String conNo=value_split[0];
		String billMonth=value_split[1];
		String rebate=value_split[2];
		String amt=value_split[3];
		System.out.println(conNo+"-"+billMonth+"-"+rebate+"-"+amt);
	    ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
	    Unique unique=(Unique) ctx.getBean("unique");
	    String transactionRefNo=String.valueOf(unique.get());
	    String PATTERN="ddMMyy";
		SimpleDateFormat dateFormat=new SimpleDateFormat();
		dateFormat.applyPattern(PATTERN);
		String currDate=dateFormat.format(Calendar.getInstance().getTime());
		String ru="https://thedpl.in/dplcrm/bdresponse.dpl";
		String ip=request.getRemoteAddr()+"-"+rebate;
		String msg="DURGAPUR"+"|"+conNo+"|"+"NA"+"|"+amt+"|"+"NA"+"|"+"NA"+"|"+"NA"+"|"+"INR"+"|"+"NA"+"|"+"R"+"|"+"durgapur"+"|"+"NA"+"|"+"NA"+"|"+"F"+"|"+currDate+"|"+"E"+"|"+transactionRefNo+"|"+billMonth+"|"+ip+"|"+"NA"+"|"+"NA"+"|"+ru;
		ChecksumBillDesk cbd=(ChecksumBillDesk)ctx.getBean("checksum");
		String checkSum=cbd.HmacSHA256(msg,ChecksumKey);
		String finalMessage=msg+"|"+checkSum;
		System.out.println("Final Message Parameter which will be sent to BillDesk-"+finalMessage);
		PaymentRequestDAO pdao=(PaymentRequestDAO)ctx.getBean("pdao");
		int countTran=pdao.checkMonth(conNo, billMonth);
		System.out.println("Transaction Counter-"+countTran);
		int transactionInsert=pdao.saveTransaction(conNo, currDate, transactionRefNo, billMonth, amt, ip, msg, checkSum);
		if(countTran==0){
			ModelAndView model = new ModelAndView("finalgateway");
			request.getSession().setAttribute("msg", finalMessage);
			
			return model;
		}
		
		else{
			ModelAndView model = new ModelAndView("warning");
			request.getSession().setAttribute("msg", finalMessage);
			request.setAttribute("warning", "We have detected that you have attempted Similar Transaction earlier. Please ensure that your bank account has NOT been debited.\n\nDouble payments will not be refunded by DPL.");
			return model;
		}
		
		
		
		
		
		
		
	 	
	}
	
	@RequestMapping(value="/RegistrationHandler.dpl",method = RequestMethod.POST)
	public ModelAndView registrationHandler(HttpServletRequest request){
		
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
    	UserDAO udao=(UserDAO) ctx.getBean("udao");
    	String conNo=request.getParameter("con_no").toString();
    	String userId=request.getParameter("username").toString();
    	String password=request.getParameter("password").toString();
    	String email=request.getParameter("email").toString();
    	String mobile=request.getParameter("phone").toString();
    	
    	
    	System.out.println(conNo+" "+userId+" "+password);
    	
    	
    	int status=udao.saveUser(conNo,userId,password,mobile,email);
    	
    	if(status>0){
    	
    		ModelAndView model = new ModelAndView("userCreated");
    		return model;
    	}
    	
    	else {
    		
    		ModelAndView model = new ModelAndView("error");
    		return model;
    	}
		 
		
	}
	
	
	
	
	@RequestMapping(value="/passwordReset.dpl",method = RequestMethod.GET)
	public ModelAndView passwordReset(@RequestParam("username") String user_id,@RequestParam("password")String password,@RequestParam("newpassword") String newpassword,HttpServletRequest request){
	
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring.xml");
		UserDAO userdao=(UserDAO) ctx.getBean("udao");
		int counter=userdao.checkPresentPassword(user_id, password);
		ModelAndView model=null;
		
		if(counter==0){
			 
			model = new ModelAndView("invalidpassword"); 
		}
		
		else{
			userdao.resetPassword(user_id, newpassword);
			model = new ModelAndView("passwordsuccess");
		}
		
		request.getSession().invalidate();
		return model;
	}
	
	@RequestMapping(value="/conValidation.dpl",method = RequestMethod.GET)
	public ModelAndView conValidation(){
 
		ModelAndView model = new ModelAndView("inputConNumber"); 
		return model;
	}
	
	
	
	
	
	
		
	@RequestMapping(value="/quickpay.dpl",method = RequestMethod.GET)
	public ModelAndView quickPay(){
 
		ModelAndView model = new ModelAndView("quickpay"); 
		return model;
	}
	
	
	
	
	
	
	
	
}
