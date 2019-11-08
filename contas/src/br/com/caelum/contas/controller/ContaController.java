package br.com.caelum.contas.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.caelum.contas.dao.ContaDAO;
import br.com.caelum.contas.modelo.Conta;

@Controller
public class ContaController {
	
	@RequestMapping("/form")
	public String formulario() {
		return "conta/formulario";
	}
	
	@RequestMapping("/adicionaConta")
	public String adicionaConta(@Valid Conta conta, BindingResult bindingResult) {
		
		if (bindingResult.hasErrors()) {
			return "conta/formulario";
		}
		
		ContaDAO dao = new ContaDAO();
		dao.adiciona(conta);
		
		return "redirect:listaContas";
	}
	
	@RequestMapping("/mostraConta")
	public String mostra(Long id, Model model) {
		ContaDAO dao = new ContaDAO();
		model.addAttribute("conta", dao.buscaPorId(id));
		
		return "conta/mostra";
	}
	
	@RequestMapping("/listaContas")
	public ModelAndView listaContas() {
		ContaDAO dao = new ContaDAO();
		List<Conta> contas = dao.lista();
		
		ModelAndView mv = new ModelAndView("conta/lista");
		mv.addObject("contas", contas);
		
		return mv;
	}
	
	@RequestMapping("/alteraConta")
	public String altera(Conta conta) {
		ContaDAO dao = new ContaDAO();
		dao.altera(conta);
		
		return "redirect:listaContas";
	}
	
	@RequestMapping("/removeConta")
	public String remove(Conta conta) {
		ContaDAO dao = new ContaDAO();
		dao.remove(conta);
		
		return "redirect:listaContas";
	}
	
	@RequestMapping("/pagaConta")
	public void paga(Conta conta, HttpServletResponse response) {
		ContaDAO dao = new ContaDAO();
		dao.paga(conta.getId());
		
		response.setStatus(200);
	}

}
