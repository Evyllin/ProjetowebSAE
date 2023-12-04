package web.modelo;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Solicitacao {

	@NotNull
	@ManyToOne
	private Item item;

	@NotNull
	@ManyToOne
	private Pessoa solicitante;

	@ManyToOne
	private Pessoa devolucao;

	@Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "solicitacao_sequence")
    @SequenceGenerator(name = "solicitacao_sequence", sequenceName = "solicitacao_sequence", allocationSize = 1)
	private Long id;

	@NotNull
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date data_solicitacao;

	@NotNull
	@Temporal(TemporalType.TIME)
	@DateTimeFormat(pattern = "HH:mm")
	private Date hora_solicitacao;

	@Temporal(TemporalType.TIME)
	@DateTimeFormat(pattern = "HH:mm")
	private Date hora_devolucao;

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public Pessoa getSolicitante() {
		return solicitante;
	}

	public void setSolicitante(Pessoa solicitante) {
		this.solicitante = solicitante;
	}

	public Pessoa getDevolucao() {
		return devolucao;
	}

	public void setDevolucao(Pessoa devolucao) {
		this.devolucao = devolucao;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getData_solicitacao() {
		return data_solicitacao;
	}

	public void setData_solicitacao(Date data_solicitacao) {
		this.data_solicitacao = data_solicitacao;
	}

	public Date getHora_solicitacao() {
		return hora_solicitacao;
	}

	public void setHora_solicitacao(Date hora_solicitacao) {
		this.hora_solicitacao = hora_solicitacao;
	}

	public Date getHora_devolucao() {
		return hora_devolucao;
	}

	public void setHora_devolucao(Date hora_devolucao) {
		this.hora_devolucao = hora_devolucao;
	}

}
