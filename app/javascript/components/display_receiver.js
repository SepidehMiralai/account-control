const initReceiver = () => {
  const transactionType = document.getElementById('transaction_type');
  const receiverBlock = document.getElementById('receiver-block');

  const displayReceiver = () => {
    if(transactionType.value == "Transfer")
      receiverBlock.classList.remove('hidden');
    else
      receiverBlock.classList.add('hidden');
  };

  transactionType.addEventListener('change', displayReceiver);
  displayReceiver();
};

export { initReceiver };
