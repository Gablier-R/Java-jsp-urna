package model;

import java.util.ArrayList;

public class Reuniao {
	
	private int idReuniao;
    private String titulo;
    private String data;
    private String hora;
    private String local;
    private ArrayList<Usuario> participantes;
    
	public int getIdReuniao() {
		return idReuniao;
	}
	public void setIdReuniao(int idReuniao) {
		this.idReuniao = idReuniao;
	}

	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getHora() {
		return hora;
	}
	public void setHora(String hora) {
		this.hora = hora;
	}
	public String getLocal() {
		return local;
	}
	public void setLocal(String local) {
		this.local = local;
	}
	public ArrayList<Usuario> getParticipantes() {
		return participantes;
	}
	public void setParticipantes(ArrayList<Usuario> participantes) {
		this.participantes = participantes;
	}
	@Override
	public String toString() {
		return "Reuniao [idReuniao=" + idReuniao + ", titulo=" + titulo + ", data=" + data + ", hora=" + hora
				+ ", local=" + local + ", participantes=" + participantes + "]";
	}

	
    
	
    
    
    
}
