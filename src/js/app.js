require('@csstools/normalize.css');
require('./styles/styles.css');

require('./scripts/index');

if (module.hot) {
	module.hot.accept();
}
