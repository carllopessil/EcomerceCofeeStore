package DAO;

public class ClienteDAO {
    private int id;
    private String nomeCompleto;
    private String email;
    private String cpf;
    private String senha;
    private String cepFaturamento;
    private String logradouroFaturamento;
    private int numeroFaturamento;
    private String complementoFaturamento;
    private String bairroFaturamento;
    private String cidadeFaturamento;
    private String ufFaturamento;
    private int idEnderecoPadrao;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomeCompleto() {
        return nomeCompleto;
    }

    public void setNomeCompleto(String nomeCompleto) {
        this.nomeCompleto = nomeCompleto;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getCepFaturamento() {
        return cepFaturamento;
    }

    public void setCepFaturamento(String cepFaturamento) {
        this.cepFaturamento = cepFaturamento;
    }

    public String getLogradouroFaturamento() {
        return logradouroFaturamento;
    }

    public void setLogradouroFaturamento(String logradouroFaturamento) {
        this.logradouroFaturamento = logradouroFaturamento;
    }

    public int getNumeroFaturamento() {
        return numeroFaturamento;
    }

    public void setNumeroFaturamento(int numeroFaturamento) {
        this.numeroFaturamento = numeroFaturamento;
    }

    public String getComplementoFaturamento() {
        return complementoFaturamento;
    }

    public void setComplementoFaturamento(String complementoFaturamento) {
        this.complementoFaturamento = complementoFaturamento;
    }

    public String getBairroFaturamento() {
        return bairroFaturamento;
    }

    public void setBairroFaturamento(String bairroFaturamento) {
        this.bairroFaturamento = bairroFaturamento;
    }

    public String getCidadeFaturamento() {
        return cidadeFaturamento;
    }

    public void setCidadeFaturamento(String cidadeFaturamento) {
        this.cidadeFaturamento = cidadeFaturamento;
    }

    public String getUfFaturamento() {
        return ufFaturamento;
    }

    public void setUfFaturamento(String ufFaturamento) {
        this.ufFaturamento = ufFaturamento;
    }

    public int getIdEnderecoPadrao() {
        return idEnderecoPadrao;
    }

    public void setIdEnderecoPadrao(int idEnderecoPadrao) {
        this.idEnderecoPadrao = idEnderecoPadrao;
    }
}
