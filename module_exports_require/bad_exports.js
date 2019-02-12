var exports = module.exports = {}

console.log('Bad exports = ', exports)

exports = {
  greeting: () => {
    return 'Hello'
  }
}

console.log('Bad exports after re-assigned to different object = ', exports)
