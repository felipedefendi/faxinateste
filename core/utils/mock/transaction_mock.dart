List<Map<String, String>> getTransactionMock() {
  return [
    {
      "date": "25/07/2024",
      "time": "13:00",
      "type": "Pagamento",
      "id": "#1234569843",
      "amount": "- R\$150.00",
      "paymentMethod": "Cartão de Crédito 1",
      "category": "Diária"
    },
    {
      "date": "30/07/2024",
      "time": "10:30",
      "type": "Depósito carteira",
      "id": "#12345",
      "amount": "+ R\$150.00",
      "paymentMethod": "Carteira",
      "category": "Depósito"
    },
    {
      "date": "04/08/2024",
      "time": "09:45",
      "type": "Pagamento",
      "id": "#1234569843",
      "amount": "- R\$150.00",
      "paymentMethod": "Cartão de Crédito 1",
      "category": "Diária"
    },
  ];
}
