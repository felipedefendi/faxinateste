List<Map<String, String>> getCardsMock() {
  return [
    {
      "type": "Cartão Elo Crédito",
      "cardNumber": "14578-4756-8458-4125",
      "expiryDate": "25/07/2030",
      "cvv": "353",
      "holderName": "Emanoelli Galheri",
      "holderCpf": "092.765.987-06",
      "nickname": "Cartão Elo Crédito",
      "cardType": "Crédito"
    },
    {
      "type": "Cartão Elo Débito",
      "cardNumber": "4785-6754-7895-1234",
      "expiryDate": "15/10/2027",
      "cvv": "123",
      "holderName": "Emanoelli Galheri",
      "holderCpf": "092.765.987-06",
      "nickname": "Cartão Elo Débito",
      "cardType": "Débito"
    },
  ];
}

double getBalanceMock() {
  return 100.00;
}
