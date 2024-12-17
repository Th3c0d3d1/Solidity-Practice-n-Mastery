// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

// Structs
contract Structs1 {
    struct Book {

        // Struct attributes
        string title;
        string author;
        bool completed;
    }

    // Initiate array of books
    // Datatype of array (given first in sol) is Book
    // Dynamic array
    Book[] public books;

    // Add book
    // 2 Arguments: title and author
    function add1(string memory _title, string memory _author) public {
        books.push(Book(_title, _author, false));
    }

    // Add book
    // Struct in view
    function add2(string memory _title, string memory _author) public {
        books.push(Book({title: _title, author: _author, completed: false}));
    }

    // Add book
    function add3(string memory _title, string memory _author) public {

        // Instanciate a new book
        Book memory book;
        book.title = _title;
        book.author = _author;
        // completed is "false" by default

        // Add book to array
        books.push(book);
    }

    // Getting book struct from array
    function get(uint _index)
        public
        view
        returns (string memory title, string memory author, bool completed)
    {
        // Get book from specific index in array
        Book storage book = books[_index];
        return (book.title, book.author, book.completed);
    }

    // update completed
    function complete(uint _index) public {

        // Get book from specific index in array
        Book storage book = books[_index];

        // Update completed bool
        book.completed = true;
    }
}
