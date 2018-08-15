class TarefasPage
  include Capybara::DSL

  def painel
    find('#task-board')
  end

  def buscar_tr(nome)
    find('#tasks tbody tr', text: nome)
  end

  def busca_trs
    all('#tasks tbody tr')
  end

  def alerta
    find('.alert-warn').text
  end

  def cadastrar(nome, data_f)
    find('#insert-button').click

    within('#add-task') do
      fill_in 'title', with: nome
      fill_in 'dueDate', with: data_f
      click_on 'Cadastrar'
    end
  end

  def busca(nome)
    find('#search-input').set nome
    find('#search-button').click
  end

  def solicita_remocao(nome)
    tr = buscar_tr(nome)
    tr.find('#delete-button').click
  end

  def confirma_modal
    # modal.find('button', text: 'Sim').click

    within('.modal-content') do
      click_button 'Sim'
    end
  end

  def deixa_queto_modal
    # modal.find('button', text: 'Não, deixa queto.').click

    within('.modal-content') do
      click_button 'Não, deixa queto.'
    end
  end

  def voltar
    click_on 'Voltar' if page.has_css?('#add-task')
  end

  # def modal
  #   find('.modal-content')
  # end
end

# click_link para elemento a (link)
# click_button para elemento button (botão)
# click_on para elemento span,div,table,tr,etc...
