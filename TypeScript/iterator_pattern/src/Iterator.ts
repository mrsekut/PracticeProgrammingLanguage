// Iterator Interface
export default interface AuthorIterator {
  hasNext: () => boolean;
  next: () => string;
}

// export default interface AuthorIterator <T>{
//   hasNext: () => boolean;
//   next: () => T;
// }
