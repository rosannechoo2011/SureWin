package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.result;
import model.resultDataManager;

@SuppressWarnings("serial")
public class ProcessAddResult extends HttpServlet {
	public void processRequest(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException, IllegalStateException {

		resultDataManager RDM = new resultDataManager();
		if(RDM.retrieveAll().isEmpty()){
			result tempResult = new result("19/02/2014","1652=8833=8456","2801=3874=4155=3478=2795=9370=2502=7510=7984=4131","6297=6416=3250=5888=9376=9115=3535=9555=5191=9629");
			RDM.add(tempResult);
			tempResult = new result("19/02/2014","4332=6108=6489","6600=9115=1610=3169=9261=6084=3167=2654=8082=7977","8230=6552=7582=6396=6807=4514=3066=6017=8824=1221");
			RDM.add(tempResult);
			tempResult = new result("16/02/2014","6402=6332=6081","5151=6254=5038=2014=5316=3625=7032=9722=1476=3948","5017=3533=8432=8408=6100=4742=3869=8675=8405=4972");
			RDM.add(tempResult);
			tempResult = new result("15/02/2014","4889=2716=3636","9071=3798=6909=1746=7330=6940=4247=3330=9310=2382","1019=9156=2544=7001=9999=5268=8901=7134=6827=8439");
			RDM.add(tempResult);
			tempResult = new result("13/02/2014","3456=4262=6975","7368=9306=5335=5404=6880=8886=6266=4788=7601=9975","5782=2974=8996=8783=8318=2150=1414=7210=8876=4067");
			RDM.add(tempResult);
			tempResult = new result("9/02/2014","6794=1615=9805","8530=7000=1204=1269=2295=8292=7458=2785=1457=9351","4848=1543=5378=5375=8470=5443=8235=4222=5110=5650");
			RDM.add(tempResult);
			tempResult = new result("8/02/2014","5294=9241=2696","1006=2898=5890=5210=2574=4301=1085=1242=8872=6567","8723=2024=6662=6712=4088=2419=7155=8763=2190=4441");
			RDM.add(tempResult);
			tempResult = new result("5/02/2014","2694=6627=8008","1881=8612=4125=1505=5228=4101=2838=2965=2551=1773","8850=5191=8794=4162=1386=8611=6700=6916=5565=3920");
			RDM.add(tempResult);
			tempResult = new result("2/02/2014","5011=9903=6854","5448=2510=5047=3088=5254=2255=3357=8067=4409=5824","1656=4163=1875=3833=9828=4102=2817=2907=6337=9974");
			RDM.add(tempResult);
			tempResult = new result("1/02/2014","8933=4192=1025","8523=5231=6209=1888=6798=4457=1768=4974=6377=1653","2017=5840=7755=5819=6777=9027=4403=9261=2608=6235");
			RDM.add(tempResult);
			tempResult = new result("29/01/2014","3538=1186=2183","3654=8427=9890=3415=2717=3569=9232=4166=2526=4536","1531=4458=3178=9057=9401=3483=6147=6419=7665=3313");
			RDM.add(tempResult);
			
		}
		
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException{
		try{
		processRequest(request, response);
		}catch(IllegalStateException e){
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException{
		try{
		processRequest(request, response);
		}catch(IllegalStateException e){
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
