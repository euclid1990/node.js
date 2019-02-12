const vndJpy = 0.0047;

function roundTwo(amount) {
  return Math.round(amount * 100) / 100;
}

exports.vndToJpy = vnd => roundTwo(vnd * vndJpy);

exports.jpyToVnd = jpy => roundTwo(jpy / vndJpy);
