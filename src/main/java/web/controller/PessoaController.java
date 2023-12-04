package web.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import web.dao.PessoaDao;
import web.modelo.Pessoa;

@Transactional
@Controller
@RequestMapping("/pessoa")
public class PessoaController {

	private List<Pessoa> lista_pessoas;

	@Autowired
	PessoaDao dao;

	@RequestMapping("/novo")
	public String pessoa() {
		return "pessoa/novo";
	}

	@RequestMapping(value = "/adiciona", method = RequestMethod.POST)
	public String adiciona(@Valid Pessoa pessoa, BindingResult result) {
		if (result.hasErrors()) {
			return "redirect:novo";
		}

		// Adiciona no banco de dados
		dao.adiciona(pessoa);
		return "redirect:lista";
	}

	@RequestMapping("/lista")
	public String lista(Model model) {
		this.lista_pessoas = dao.lista();
		model.addAttribute("pessoas", this.lista_pessoas);
		return "pessoa/lista";
	}

	@RequestMapping("/remove")
	public String remove(Pessoa pessoa) {
		dao.remove(pessoa.getId());
		return "redirect:lista";
	}

	@RequestMapping("/exibe")
	public String exibe(Long id, Model model) {
		model.addAttribute("pessoa", dao.buscaPorId(id));
		return "pessoa/exibe";
	}

	@RequestMapping("/edita")
	public String edita(Long id, Model model) {
		model.addAttribute("pessoa", dao.buscaPorId(id));
		return "pessoa/edita";
	}

	@RequestMapping(value = "/altera", method = RequestMethod.POST)
	public String altera(@Valid Pessoa pessoa, BindingResult result) {
		this.lista_pessoas = dao.buscaPorNome(pessoa.getNome());
		if (result.hasErrors()) {
			return "redirect:edita?id=" + pessoa.getId();
		}

		dao.altera(pessoa);
		return "redirect:lista";
	}

}
