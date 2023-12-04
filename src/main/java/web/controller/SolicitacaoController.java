package web.controller;

import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dao.ItemDao;
import web.dao.PessoaDao;
import web.dao.SolicitacaoDao;
import web.modelo.Item;
import web.modelo.Pessoa;
import web.modelo.Solicitacao;

@Transactional
@Controller
@RequestMapping("/solicitacao")
public class SolicitacaoController {

	private List<Solicitacao> lista_solicitacao;
	private List<Item> lista_itens;
	private List<Pessoa> lista_pessoa;
	
	@Autowired
	SolicitacaoDao dao;

	@Autowired
	ItemDao dao_item;
	
	@Autowired
	PessoaDao dao_pessoa;

	@RequestMapping("/novo")
	public String solicitacao(Model model) {
		this.lista_itens = dao_item.lista();
		model.addAttribute("lista_itens", this.lista_itens);
		this.lista_pessoa = dao_pessoa.lista();
		model.addAttribute("lista_pessoa", this.lista_pessoa);
;		return "solicitacao/novo";
	}

	@RequestMapping(value = "/adiciona", method = RequestMethod.POST)
	public String adiciona(@Valid Solicitacao solicitacao, BindingResult result) {
		if (result.hasErrors()) {
			System.out.println(result);
			return "redirect:novo";
		}

		// Adiciona no banco de dados
		dao.adiciona(solicitacao);
		return "redirect:lista";
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		this.lista_solicitacao = dao.lista();
		model.addAttribute("solicitacao", this.lista_solicitacao);
		return "solicitacao/lista";
	}

	@RequestMapping("/remove")
	public String remove(Solicitacao solicitacao) {
		dao.remove(solicitacao.getId());
		return "redirect:lista";
	}

	@RequestMapping("/exibe")
	public String exibe(Long id, Model model) {
		model.addAttribute("solicitacao", dao.buscaPorId(id));
		return "solicitacao/exibe";
	}

	@RequestMapping("/edita")
	public String solicitacao1(Model model) {
		this.lista_itens = dao_item.lista();
		model.addAttribute("lista_itens", this.lista_itens);
		this.lista_pessoa = dao_pessoa.lista();
		model.addAttribute("lista_pessoa", this.lista_pessoa);
		return "solicitacao/edita";
	}

	@RequestMapping(value = "/altera", method = RequestMethod.POST)
	public String altera(@Valid Solicitacao solicitacao, BindingResult result) {
		if (result.hasErrors()) {
			return "redirect:edita?id=" + solicitacao.getId();
		}

		dao.altera(solicitacao);
		return "redirect:lista";
	}
	
	
	@RequestMapping("/devolver")
	public String devolver(Long id, Model model) {
		Solicitacao s = dao.buscaPorId(id);
		Pessoa devolucao = dao_pessoa.buscaPorId(1L); //Pega a pessoa de id 1
		s.setHora_devolucao(new Date());
		s.setDevolucao(devolucao);
		dao.altera(s);
		return "redirect:exibe?id="+s.getId();
	}

}
