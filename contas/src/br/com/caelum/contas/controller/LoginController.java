package br.com.caelum.contas.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.caelum.contas.dao.UsuarioDAO;
import br.com.caelum.contas.modelo.Usuario;

@Controller
public class LoginController {
	
	@RequestMapping("/login")
	public String login() {
		return "usuario/login";
	}
	
	@RequestMapping("/entrar")
	public String entrar(Usuario usuario, HttpSession session) {
		UsuarioDAO dao = new UsuarioDAO();
		
		if(dao.existeUsuario(usuario)) {
			session.setAttribute("usuarioLogado", usuario);
			
			return "redirect:listaContas";
		} else {
			return "redirect:login";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("usuarioLogado", null);
		
		return "redirect:login";
	}

}
