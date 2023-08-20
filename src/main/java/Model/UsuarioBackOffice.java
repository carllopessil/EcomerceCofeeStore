package br.com.gymcontrol.Model;

public class UsuarioBackOffice {
    private int ID;
    private String Nome;
    private String Email;
    private String Senha;
    private String Grupo;
    private String Status;

    private String CPF;


    public UsuarioBackOffice(int ID, String nome, String email, String senha, String grupo, String status, String CPF) {
        this.ID = ID;
        Nome = nome;
        Email = email;
        Senha = senha;
        Grupo = grupo;
        Status = status;
        this.CPF = CPF;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getNome() {
        return Nome;
    }

    public void setNome(String nome) {
        Nome = nome;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public String getSenha() {
        return Senha;
    }

    public void setSenha(String senha) {
        Senha = senha;
    }

    public String getGrupo() {
        return Grupo;
    }

    public void setGrupo(String grupo) {
        Grupo = grupo;
    }

    public String getStatus() {
        return Status;
    }

    public void setStatus(String status) {
        Status = status;
    }

    public String getCPF() {
        return CPF;
    }

    public void setCPF(String CPF) {
        this.CPF=CPF;

    }
}
