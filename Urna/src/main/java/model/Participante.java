package model;

public class Participante {
	
	private int idReuniao;
    private int idUsuario;
    
	public int getIdReuniao() {
		return idReuniao;
	}
	public void setIdReuniao(int idReuniao) {
		this.idReuniao = idReuniao;
	}
	public int getIdUsuario() {
		return idUsuario;
	}
	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}
	@Override
	public String toString() {
		return "Participante [idReuniao=" + idReuniao + ", idUsuario=" + idUsuario + "]";
	}
    
    

}
