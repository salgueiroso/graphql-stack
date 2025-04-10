import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient()

export const resolvers = {
    Query: {
        posts: () => prisma.post.findMany(),
        post: (_: any, args: { id: number }) => prisma.post.findUnique({ where: { id: args.id } }),
    },
    Mutation: {
        createPost: (_: any, args: { title: string, content: string }) =>
            prisma.post.create({
                data: {
                    title: args.title,
                    content: args.content,
                },
            }),
    },
};
