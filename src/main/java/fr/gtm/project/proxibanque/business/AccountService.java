package fr.gtm.project.proxibanque.business;

import org.springframework.beans.factory.annotation.Autowired;

import fr.gtm.project.proxibanque.entity.Account;
import fr.gtm.project.proxibanque.entity.Message;
import fr.gtm.project.proxibanque.entity.TYPE_CARD;

public class AccountService extends CrudService<Account> {

	@Autowired
	private WithdrawalComponent withdrawalComp;
	
	@Autowired
	private DepositComponent depotComp;

	public Message transferInternal(Integer idAccount, Float amount) {
		// TODO
		return new Message("Virement effectué avec succès !");
	}

	public Message withdrawCash(Integer idAccount, Float amount) {
		final Account account = this.read(idAccount);
		final Message result = this.withdrawalComp.processCash(account, amount);
		if (!result.isError()) {
			account.setBalance(account.getBalance() - amount);
			this.edit(account);
		}
		return result;
	}

	public Message withdrawBankCard(Integer idAccount, TYPE_CARD type) {
		return this.withdrawalComp.processBankCard(this.read(idAccount), type);
	}

	public Message withdrawCheckBook(Integer idAccount) {
		return this.withdrawalComp.processCheckBook(this.read(idAccount));
	}
	
	public Message depositCash(Integer idAccount, Float amount) {
		final Account account = this.read(idAccount);
		final Message result = this.depotComp.depositCash(account, amount);
		
		if(!result.isError()) {
			account.setBalance(account.getBalance() + amount);
			this.edit(account);
		}
		
		return result;
	}
}
