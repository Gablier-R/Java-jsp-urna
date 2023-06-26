package model;

import com.mysql.cj.jdbc.Blob;

public class Candidato {
	private int id;
	private String nome;
	private String numero;
	private String tipo;
	private String partido;
	private int votos;
	private Blob imagem;
	
	public Blob getImagem() {
		return imagem;
	}
	public void setImagem(Blob imagem) {
		this.imagem = imagem;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getNumero() {
		return numero;
	}
	public void setNumero(String numero) {
		this.numero = numero;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public String getPartido() {
		return partido;
	}
	public void setPartido(String partido) {
		this.partido = partido;
	}
	public int getVotos() {
		return votos;
	}
	public void setVotos(int votos) {
		this.votos = votos;
	}
	@Override
	public String toString() {
		return "Candidato [id=" + id + ", nome=" + nome + ", numero=" + numero + ", tipo=" + tipo + ", partido="
				+ partido + ", votos=" + votos + ", imagem=" + imagem + "]";
	}
	
	
	
}
