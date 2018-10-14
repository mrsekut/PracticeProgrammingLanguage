// Iterator Interface
export default interface AuthorIterator<T> {
  hasNext: () => boolean;
  next: () => T;
}
