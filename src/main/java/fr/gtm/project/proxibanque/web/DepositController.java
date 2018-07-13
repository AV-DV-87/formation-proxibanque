package fr.gtm.project.proxibanque.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import fr.gtm.project.proxibanque.business.AccountService;
import fr.gtm.project.proxibanque.business.ClientService;
import fr.gtm.project.proxibanque.entity.Client;
import fr.gtm.project.proxibanque.entity.TYPE_COMPTE;



@Controller
@RequestMapping("/{id}/depot")
public class DepositController {
	
	@Autowired
	private ClientService clientService;

	@Autowired
	private AccountService accountService;

	@RequestMapping("/especes")
	public ModelAndView cashWithdrawal(@PathVariable Integer id) {
		final ModelAndView mav = new ModelAndView("deposit/cash");
		final Client client = this.clientService.read(id);
		mav.addObject("accounts",
				client.getAccounts().stream().filter(
						(account) -> account.getType() == TYPE_COMPTE.SAVING)
						.toArray());
		return mav;
	}
	
	@PostMapping("/especes")
	public ModelAndView confirmCashWithdrawal(@RequestParam Integer debitId,
			@RequestParam Float amount) {
		final ModelAndView mav = new ModelAndView("deposit/cash");
		mav.addObject("result",
				this.accountService.depositCash(debitId, amount));
		return mav;
	}
	
}
