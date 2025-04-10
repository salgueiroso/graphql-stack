export const typeDefs = `#graphql
    type Post {
        id: Int!
        title: String!
        content: String!
    }

    type Query {
        posts: [Post!]!
        post(id: Int!): Post
    }

    type Mutation {
        createPost(title: String!, content: String!): Post!
    }
`;