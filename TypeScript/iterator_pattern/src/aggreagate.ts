import AuthorIterator from './iterator';

// Aggregate Interface
export default interface AuthorList {
  createIterator: () => AuthorIterator;
}
