// Transfer
class Transfer {
  final double value;
  final int accountNumber;

  Transfer(this.value, this.accountNumber);

  @override
  String toString() {
    // TODO: implement toString
    return 'Transferencia { Valor: ' +
        this.value.toString() +
        ' - Account: ' +
        this.accountNumber.toString() +
        ' }';
  }
}
