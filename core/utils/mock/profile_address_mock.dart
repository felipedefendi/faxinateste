class ProfileAddressMock {
  static List<Map<String, dynamic>> _addresses = [
    {
      'id': 1,
      'title': 'Endereço 1',
      'street': 'Avenida Paulista',
      'number': '1000',
      'neighborhood': 'Jd. Aclimação',
      'city': 'São Paulo',
      'state': 'SP',
      'zipCode': '01310-100',
      'isPrimary': true,
    },
    {
      'id': 2,
      'title': 'Endereço 2',
      'street': 'Rua das Flores',
      'number': '123',
      'neighborhood': 'Centro',
      'city': 'Rio de Janeiro',
      'state': 'RJ',
      'zipCode': '22010-001',
      'isPrimary': false,
    },
    {
      'id': 3,
      'title': 'Endereço 3',
      'street': 'Alameda Santos',
      'number': '400',
      'neighborhood': 'Savassi',
      'city': 'Belo Horizonte',
      'state': 'MG',
      'zipCode': '30140-000',
      'isPrimary': false,
    },
  ];

  static List<Map<String, dynamic>> getAddresses() {
    return _addresses;
  }

  static void setPrimary(Map<String, dynamic> address) {
    _addresses = _addresses.map((a) {
      if (a['id'] == address['id']) {
        return {...a, 'isPrimary': true};
      } else {
        return {...a, 'isPrimary': false};
      }
    }).toList();
  }

  static void removeAddress(Map<String, dynamic> address) {
    _addresses.removeWhere((a) => a['id'] == address['id']);
  }

  static void updateAddress(Map<String, dynamic> updatedAddress) {
    for (var i = 0; i < _addresses.length; i++) {
      if (_addresses[i]['id'] == updatedAddress['id']) {
        _addresses[i] = updatedAddress;
      }
    }
  }
}
