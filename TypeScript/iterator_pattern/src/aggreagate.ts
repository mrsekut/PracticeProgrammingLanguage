import AuthorIterator from './iterator';

// Aggregate Interface
export default interface AuthorList<T> {
  createIterator: () => AuthorIterator<T>;
}
